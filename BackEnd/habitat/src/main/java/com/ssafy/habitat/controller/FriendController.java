package com.ssafy.habitat.controller;

import com.ssafy.habitat.config.TokenProvider;
import com.ssafy.habitat.dto.RequestFriendRequestDto;
import com.ssafy.habitat.dto.RequestUserDto;
import com.ssafy.habitat.dto.ResponseUserDto;
import com.ssafy.habitat.entity.DrinkLog;
import com.ssafy.habitat.entity.Friend;
import com.ssafy.habitat.entity.FriendRequest;
import com.ssafy.habitat.entity.User;
import com.ssafy.habitat.service.*;
import com.ssafy.habitat.websocket.CustomWebSocketHandler;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping("/api/friends")
public class FriendController {

    private final Logger LOGGER = LoggerFactory.getLogger(FriendController.class);

    public static final String AUTHORIZATION_HEADER = "Authorization";
    private FriendService friendService;
    private FriendRequestService friendRequestService;
    private UserService userService;
    private DrinkLogService drinkLogService;
    private RewardService rewardService;
    private TokenProvider tokenProvider;
    private CustomWebSocketHandler customWebSocketHandler;

    @Autowired
    public FriendController(FriendService friendService, FriendRequestService friendRequestService, UserService userService, DrinkLogService drinkLogService, RewardService rewardService, TokenProvider tokenProvider, CustomWebSocketHandler customWebSocketHandler) {
        this.friendService = friendService;
        this.friendRequestService = friendRequestService;
        this.userService = userService;
        this.drinkLogService = drinkLogService;
        this.rewardService = rewardService;
        this.tokenProvider = tokenProvider;
        this.customWebSocketHandler = customWebSocketHandler;
    }

    @GetMapping("/all")
    @ApiOperation(value = "친구목록 조회", notes="유저의 친구목록을 조회합니다.")
    public ResponseEntity getFriendList(HttpServletRequest request) {
        LOGGER.info("getFriendList() : 유저의 친구목록 조회");

        String userKey = tokenProvider.getUserKey(request.getHeader(AUTHORIZATION_HEADER));
        User user = userService.getUser(userKey); // userKey의 유저를 찾습니다.

        List<User> friendList = friendService.getFriendList(user); // 유저의 친구목록을 불러옵니다.

        // Entity -> Dto 변환
        List<ResponseUserDto.Friend> friendDtoList = new ArrayList<>();
        for (int i = 0; i < friendList.size(); i++) {
            User curUser = friendList.get(i);

            LocalDateTime last = null;
            DrinkLog recentLog = drinkLogService.getRecentLog(curUser);
            if(recentLog!=null) {
                last = recentLog.getCreatedAt();
            }

            friendDtoList.add(ResponseUserDto.Friend.builder()
                    .userKey(curUser.getUserKey())
                    .nickname(curUser.getNickname())
                    .imgUrl(curUser.getImgUrl())
                    .recent(last)
                    .build());
        }

        return new ResponseEntity<>(friendDtoList, HttpStatus.OK);
    }

    @GetMapping("/code")
    @ApiOperation(value = "친구코드 조회", notes="유저의 친구코드를 조회합니다.")
    public ResponseEntity getFriendCode(HttpServletRequest request) {
        LOGGER.info("getFriendCode() : 유저의 친구코드 조회");

        String userKey = tokenProvider.getUserKey(request.getHeader(AUTHORIZATION_HEADER));
        User user = userService.getUser(userKey); // userKey의 유저를 찾습니다.

        // 찾아온 유저의 친구코드를 불러와 리턴합니다.
        HashMap<String, String> map = new HashMap<>();
        String friendCode = user.getFriendCode();

        map.put("friendCode", friendCode);
        return new ResponseEntity<>(map, HttpStatus.OK);

    }

    @PostMapping("/request/userkey")
    @ApiOperation(value = "친구신청 보내기(유저키)", notes="해당 유저키의 유저에게 친구신청을 보냅니다.")
    public ResponseEntity sendFriendListByUserKey(HttpServletRequest request, @RequestBody RequestUserDto.RequestFriend requestFriendDto) throws IOException {
        LOGGER.info("sendFriendListByUserKey() : 친구신청 보내기(유저키)");

        String userKey = tokenProvider.getUserKey(request.getHeader(AUTHORIZATION_HEADER));
        User fromUser = userService.getUser(userKey); // userKey의 유저를 찾습니다.
        User toUser = userService.getUser(requestFriendDto.getFriendUserKey()); // 친구신청할 userKey의 유저를 찾습니다.

        FriendRequest newFriendRequest = FriendRequest.builder().from(fromUser).to(toUser).status(0).build();

        // 친구신청의 유효성(이미 친구 관계에 있진 않은지)을 확인합니다.
        friendService.checkFriendRequestPossible(fromUser, toUser);
        // 친구신청의 유효성(이미 신청했는지, 자기 자신에게 신청했는지)를 확인합니다.
        friendRequestService.checkFriendRequestPossible(newFriendRequest);
        // 친구신청을 보냅니다.
        friendRequestService.addFriendRequest(newFriendRequest);

        // 신청 받은 유저(fromUser)에게 웹소켓 보내기 필요
        String message = fromUser.getNickname()+"님으로부터 친구신청이 도착했어요!";
        customWebSocketHandler.sendMessage(toUser, message);

        return new ResponseEntity<>(HttpStatus.OK);
    }

    @PostMapping("/request/code")
    @ApiOperation(value = "친구신청 보내기(친구코드)", notes="해당 친구코드로 친구신청을 보냅니다.")
    public ResponseEntity sendFriendListByCode(HttpServletRequest request, @RequestBody RequestUserDto.FriendCode requestFriendDto) throws IOException {
        LOGGER.info("sendFriendListByCode() : 친구신청 보내기(친구코드)");

        String userKey = tokenProvider.getUserKey(request.getHeader(AUTHORIZATION_HEADER));
        User fromUser = userService.getUser(userKey); // userKey의 유저를 찾습니다.
        User toUser = userService.getByFriendCode(requestFriendDto.getFriendCode()); // 친구코드에 해당하는 유저를 찾습니다.

        // 친구신청의 유효성(이미 친구 관계에 있진 않은지)을 확인합니다.
        friendService.checkFriendRequestPossible(fromUser, toUser);

        // 친구신청을 보냅니다.
        FriendRequest newFriendRequest = FriendRequest.builder().from(fromUser).to(toUser).status(0).build();
        friendRequestService.addFriendRequest(newFriendRequest);

        // 신청 받은 유저(fromUser)에게 웹소켓 보내기 필요
        String message = fromUser.getNickname()+"님으로부터 친구신청이 도착했어요!";
        customWebSocketHandler.sendMessage(toUser, message);

        return new ResponseEntity<>(HttpStatus.OK);
    }

    @PutMapping("/request/ok")
    @ApiOperation(value = "친구신청 수락", notes="해당 친구신청을 수락합니다.")
    public ResponseEntity acceptFriendList(HttpServletRequest request, @RequestBody RequestFriendRequestDto requestFriendRequestDto) throws IOException {
        LOGGER.info("acceptFriendList() : 친구신청 수락");

        String userKey = tokenProvider.getUserKey(request.getHeader(AUTHORIZATION_HEADER));
        User user = userService.getUser(userKey); // userKey의 유저를 찾습니다.
        FriendRequest friendRequest = friendRequestService.getFriendRequestByRequestKey(requestFriendRequestDto.getFriendRequestKey()); // requestKey의 친구신청 내역을 찾습니다.

        // 해당 유저에게 도착한 친구신청내역인지 & 이미 처리가 끝난 요청인지 확인
        friendRequestService.checkFriendRequestAuthorization(user, friendRequest);

        // 해당 친구신청 내역을 수락으로 변경
        friendRequestService.modifyFriendRequest(friendRequest, 1);
        // 이미 친구인지 확인
        friendService.checkFriendRequestPossible(friendRequest.getFrom(), friendRequest.getTo());

        // 친구 내역 입력
        friendService.addFriend(Friend.builder().myId(friendRequest.getFrom()).friendId(friendRequest.getTo()).build());
        friendService.addFriend(Friend.builder().myId(friendRequest.getTo()).friendId(friendRequest.getFrom()).build());

        // 친구 추가에 따른 해금 확인
        rewardService.checkFriendUnlock(friendRequest.getFrom());
        rewardService.checkFriendUnlock(friendRequest.getTo());

        // 친구 신청했던 유저(fromUser)에게 친구가 되었음 웹소켓 보내기 필요
        String message = friendRequest.getTo().getNickname()+"님과 친구가 되었습니다!";
        customWebSocketHandler.sendMessage(friendRequest.getFrom(), message);


        return new ResponseEntity<>(HttpStatus.OK);
    }

    @PutMapping("/request/cancel")
    @ApiOperation(value = "친구신청 거절", notes="해당 친구신청을 거절(삭제)합니다.")
    public ResponseEntity refuseFriendList(HttpServletRequest request, @RequestBody RequestFriendRequestDto requestFriendRequestDto) {
        LOGGER.info("refuseFriendList() : 친구신청 거절");

        String userKey = tokenProvider.getUserKey(request.getHeader(AUTHORIZATION_HEADER));
        User user = userService.getUser(userKey); // userKey의 유저를 찾습니다.
        FriendRequest friendRequest = friendRequestService.getFriendRequestByRequestKey(requestFriendRequestDto.getFriendRequestKey());

        // 해당 유저에게 도착한 친구신청내역인지 확인
        friendRequestService.checkFriendRequestAuthorization(user, friendRequest);
        // 해당 친구신청 내역을 거절로 변경
        friendRequestService.modifyFriendRequest(friendRequest, 2);

        return new ResponseEntity<>(HttpStatus.OK);
    }


    @GetMapping("/request/all")
    @ApiOperation(value = "친구신청 목록", notes="유저에게 전송된 친구신청 목록을 조회합니다.")
    public ResponseEntity getFriendRequestList(HttpServletRequest request) {
        LOGGER.info("getFriendRequestList() : 친구신청 목록 조회");

        String userKey = tokenProvider.getUserKey(request.getHeader(AUTHORIZATION_HEADER));
        User user = userService.getUser(userKey); // userKey의 유저를 찾습니다.
        List<FriendRequest> friendRequestList = friendRequestService.getFriendRequestList(user); // 유저의 친구신청 목록을 불러옵니다.

        // Entity -> Dto 변환
        List<ResponseUserDto.FriendRequest> friendRequestDtoList = new ArrayList<>();
        for (int i = 0; i < friendRequestList.size(); i++) {
            FriendRequest friendRequest = friendRequestList.get(i);
            User curUser = friendRequest.getFrom();

            friendRequestDtoList.add(ResponseUserDto.FriendRequest.builder()
                            .friendRequestKey(friendRequest.getFriendRequestKey())
                            .userKey(curUser.getUserKey())
                            .nickname(curUser.getNickname())
                            .imgUrl(curUser.getImgUrl())
                            .build());
        }

        return new ResponseEntity<>(friendRequestDtoList, HttpStatus.OK);
    }

    @PostMapping("/cok")
    @ApiOperation(value = "찌르기", notes="친구에게 찌르기 알림을 보냅니다.")
    public ResponseEntity sendCok(@RequestHeader(AUTHORIZATION_HEADER) String token, @RequestBody RequestUserDto.RequestFriend requestFriend) throws IOException {
        LOGGER.info("sendCok() : 찌르기 알림 전송");

        String userKey = tokenProvider.getUserKey(token);
        User fromUser = userService.getUser(userKey); // userKey의 유저를 찾습니다.

        User toUser = userService.getUser(requestFriend.getFriendUserKey());

        // 찌르기 받은 유저(toUser)에게 찌르기 웹소켓 보내기 필요
        String message = fromUser.getNickname()+"님이 회원님을 콕 찔렀습니다!";
        customWebSocketHandler.sendMessage(toUser, message);

        return new ResponseEntity<>(HttpStatus.OK);
    }


}