package com.ssafy.habitat.entity;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import lombok.*;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import lombok.experimental.SuperBuilder;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.GrantedAuthority;
//import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
@EnableJpaRepositories
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
@Entity
public class User extends BaseTime implements UserDetails {

    @Id
    @JsonIdentityInfo(generator = ObjectIdGenerators.StringIdGenerator.class, property = "id")
    private String userKey;
    private String nickname;
    private String password;
    private String imgUrl;
    private String friendCode;
    private int goal;
    private String socialKey;
    private String refreshKey;

    @Column(columnDefinition = "TINYINT(1)")
    private int socialType;

    /**
     * 유저가 가져야하는 데이터들
     */
    /**@OneToMany(mappedBy = "user")
    @Builder.Default
    private List<Planting> plantingList = new ArrayList<>();

    @OneToMany(mappedBy = "user")
    @Builder.Default
    private List<Collection> collectionList = new ArrayList<>();

    @OneToMany(mappedBy = "user")
    @Builder.Default
    private List<UserFlower> userFlowerList = new ArrayList<>();

    @OneToMany(mappedBy = "user")
    @Builder.Default
    private List<UserFlowerLog> userFlowerLogList = new ArrayList<>();

    @OneToMany(mappedBy = "user")
    @Builder.Default
    private List<DrinkLog> drinkLogList = new ArrayList<>();

    @OneToMany(mappedBy = "user")
    @Builder.Default
    private List<StreakLog> streakLogList = new ArrayList<>();

    @OneToMany(mappedBy = "to")
    @Builder.Default
    private List<FriendRequest> friendRequestList = new ArrayList<>();

    @OneToMany(mappedBy = "myId")
    @Builder.Default
    private List<Friend> friendList = new ArrayList<>();

    @OneToOne(mappedBy = "user")
    private UserCoaster userCoaster;
     **/
    @ElementCollection(fetch = FetchType.EAGER)
    @Builder.Default
    @JsonIgnore
    private List<String> roles = new ArrayList<>();

    /**
     * Security impl 데이터들 ================================================================================================
     */
    @Override
    @JsonIgnore
    public java.util.Collection<? extends GrantedAuthority> getAuthorities() {
        return this.roles.stream()
                .map(SimpleGrantedAuthority::new)
                .collect(Collectors.toList());
    }

    @Override
    @JsonIgnore
    public String getPassword() {
        return password;
    }

    @Override
    @JsonIgnore
    public String getUsername() {
        return userKey;
    }

    @Override
    @JsonIgnore
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    @JsonIgnore
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    @JsonIgnore
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    @JsonIgnore
    public boolean isEnabled() {
        return true;
    }

    @Override
    public String toString() {
        return "User{" +
                "userKey='" + userKey + '\'' +
                ", nickname='" + nickname + '\'' +
                ", password='" + password + '\'' +
                ", imgUrl='" + imgUrl + '\'' +
                ", friendCode='" + friendCode + '\'' +
                ", goal=" + goal +
                ", socialKey='" + socialKey + '\'' +
                ", refreshKey='" + refreshKey + '\'' +
                ", socialType=" + socialType +
                ", roles=" + roles +
                '}';
    }
}
