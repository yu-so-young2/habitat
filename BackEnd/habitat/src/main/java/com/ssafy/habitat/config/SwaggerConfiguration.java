package com.ssafy.habitat.config;

import io.swagger.annotations.SwaggerDefinition;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.*;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spi.service.contexts.SecurityContext;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import java.util.Arrays;
import java.util.List;

@Configuration
@EnableSwagger2
public class SwaggerConfiguration {

    private String version;
    private String title;

    private ApiInfo apiInfo(){
        return new ApiInfoBuilder().title("Habitat API")
                .description("<h3>Habitat의 API의 문서를 제공합니다.</h3>")
                .contact(new Contact("Habitat", "http://localhost:8081", "ssafy@ssafy.com")).license("MIT License")
                .version("1.0").build();
    }

    @Bean
    public Docket api(){
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(this.apiInfo())
                .securityContexts(Arrays.asList(securityContext())) // swagger에서 jwt 토큰값 넣기위한 설정
                .securitySchemes(Arrays.asList(apiKey())) // swagger에서 jwt 토큰값 넣기위한 설정
                .select()
                .apis(RequestHandlerSelectors.basePackage("com.ssafy.habitat.controller"))
                .paths(PathSelectors.any())
                .build();
    }

    // swagger에서 jwt 토큰값 넣기위한 설정
    private ApiKey apiKey() {
        return new ApiKey("JWT", "Authorization", "header");
    }

    private SecurityContext securityContext() {
        return SecurityContext.builder().securityReferences(defaultAuth()).build();
    }

    private List<SecurityReference> defaultAuth() {
        AuthorizationScope authorizationScope = new AuthorizationScope("global", "accessEverything");
        AuthorizationScope[] authorizationScopes = new AuthorizationScope[1];
        authorizationScopes[0] = authorizationScope;
        return Arrays.asList(new SecurityReference("JWT", authorizationScopes));
    }
}
