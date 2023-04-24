/* Blink Example
   This example code is in the Public Domain (or CC0 licensed, at your option.)
   Unless required by applicable law or agreed to in writing, this
   software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
   CONDITIONS OF ANY KIND, either express or implied.
*/
#include <stdio.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "driver/gpio.h"
#include "sdkconfig.h"

/*  아래 WROOM 32 보드에있는 LED(청색)는 GPIO2 번,
 * 그러므로 아래와 같이 재정의해야 led가 빛남
 */
#define CONFIG_BLINK_GPIO 2          // 이부분을 재정의
#define BLINK_GPIO CONFIG_BLINK_GPIO // 원래 6번으로 정의되어있음

void app_main(void)
{
    // 아두이노의 setup() 함수 부분에 해당함

    /* IOMUX 레지스터를 설정해야 함,  패드의 BLINK_GPIO */
    gpio_pad_select_gpio(BLINK_GPIO); // 사용한다고 알림

    /*GPIO 를 push/pull 출력으로 설정 */
    gpio_set_direction(BLINK_GPIO, GPIO_MODE_OUTPUT); // 출력으로 설정

    // 무한 루프에 들어감, 이후부터는 아두이노의 lpop()에 해당함
    while (1)
    {
        /* Blink 끔 (출력은 low로) */
        printf("Turning off the LED\n");
        gpio_set_level(BLINK_GPIO, 0); // 해당 핀을 low로

        vTaskDelay(1000 / portTICK_PERIOD_MS); //
        /* Blink 켬 (출력 high) */
        printf("Turning on the LED\n");
        gpio_set_level(BLINK_GPIO, 1); // 해당 핀을 high로
        vTaskDelay(1000 / portTICK_PERIOD_MS);
    }
}
