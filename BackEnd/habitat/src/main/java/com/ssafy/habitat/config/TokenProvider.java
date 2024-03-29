package com.ssafy.habitat.config;

import java.security.Key;
import java.util.Arrays;
import java.util.Base64;
import java.util.Collection;
import java.util.Date;
import java.util.stream.Collectors;

import com.ssafy.habitat.exception.CustomException;
import com.ssafy.habitat.exception.ErrorCode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.MalformedJwtException;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.UnsupportedJwtException;
import io.jsonwebtoken.security.Keys;

import javax.annotation.PostConstruct;

@Component
public class TokenProvider implements InitializingBean {
    private final Logger LOGGER = LoggerFactory.getLogger(TokenProvider.class);

    private static final String AUTHORITIES_KEY = "habitat";
    private final String secret;
    private Key key;

    public TokenProvider(@Value("${jwt.secret}") String secret){
        this.secret = secret;
    }

    //우리의 secret 값을 가지고 우리만의 key를 만들어줍니다. ( 이 함수는 Bean이 등록되는 시점에 한 번만 실행이 됩니다. )
    @Override
    public void afterPropertiesSet() throws Exception {
        byte[] keyBytes = Base64.getDecoder().decode(secret);
        this.key = Keys.hmacShaKeyFor(keyBytes);
    }

    /**token 생성 algorithm */
    public TokenInfo createToken(Authentication authentication) {

        //권한 가져오기
        String authorities = authentication.getAuthorities().stream()
                .map(GrantedAuthority::getAuthority)
                .collect(Collectors.joining(","));

        long now = (new Date()).getTime();

        //각각의 토큰을 만들어줍니다.
        String accessToken = Jwts.builder()
                .setSubject(authentication.getName())
                .claim(AUTHORITIES_KEY, authorities)
                .signWith(key, SignatureAlgorithm.HS512)
                .setExpiration(new Date(now + 86400*1*1000L))
                .compact();

        String refreshToken = Jwts.builder()
                .setSubject(authentication.getName())
                .claim(AUTHORITIES_KEY, authorities)
                .signWith(key, SignatureAlgorithm.HS512)
                .setExpiration(new Date(now + 86400*14*1000L))
                .compact();

        return TokenInfo.builder()
                .grantType("Bearer")
                .accessToken(accessToken)
                .refreshToken(refreshToken)
                .build();
    }

    /**인증 정보 조회 */
    public Authentication getAuthentication(String token) {

        //인증 값(?)을 만들고
        Claims claims = Jwts.parserBuilder()
                .setSigningKey(key)
                .build()
                .parseClaimsJws(token)
                .getBody();

        //clainms에 담아놓은 user의 정보들을 꺼냅니다.
        Collection<? extends GrantedAuthority> authorities =
                Arrays.stream(claims.get(AUTHORITIES_KEY).toString().split(","))
                        .map(SimpleGrantedAuthority::new)
                        .collect(Collectors.toList());

        return new UsernamePasswordAuthenticationToken(claims.getSubject(), claims.getSubject(), authorities);
    }

    /**인증 정보 조회 */
    public String getUserKey(String token) {
        token = token.substring(7);
        Authentication authentication = getAuthentication(token);
        return authentication.getName();
    }


    /**token 유효성 검증 */
    public String validateToken(String token){
        try{
            Jwts.parserBuilder().setSigningKey(key).build().parseClaimsJws(token);
            return "true";
        }catch(io.jsonwebtoken.security.SecurityException | MalformedJwtException e){
            LOGGER.info("잘못된 JWT 서명입니다.");
        }catch(ExpiredJwtException e){
            LOGGER.info("만료된 JWT 토큰입니다.");
            return "expired";
        }catch(UnsupportedJwtException e){
            LOGGER.info("지원하지 않는 JWT 토큰입니다.");
        }catch(IllegalArgumentException e){
            LOGGER.info("JWT 토큰이 잘못되었습니다.");
        }
        return "false";
    }
}