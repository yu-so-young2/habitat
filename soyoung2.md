# REST API response

그동안 2번의 프로젝트를 하면서 API Response를 보낼 때 항상 HttpStatus = 200 으로 전송한 후, 

```json
{
  "success" : true,
  "msg" : "",
  "data" : ..
}
```

이런 식으로 응답을 전송했다.

그러던 중 프론트에서 “data 이름으로 보내니까 헷갈린다” 라는 의견이 있었기도 하고, HttpStatus를 항상 200으로 보내는 것에 대한 확신이 없었기 때문에 RESTful API의 Response 형식에 대해 정리해보려고 한다.

### HTTP STATUS 200 고정

200으로만 응답하는 이유는 다음과 같다. 에러가 발생하긴 하지만 어쨌거나 응답은 하니까.

1) Http status code를 무조건 200으로 응답하는 경우

2) Http status code는 200으로 고정하고 응답데이터 내부 status를 별도로 전송하는 경우

등 여러 경우가 있겠으나 어쨌든 이런 식으로 **Http status code를 200으로 고정하는 것은 정부 시큐어 코딩 기준**이 그렇기 때문이다.