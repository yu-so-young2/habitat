#include <BLEDevice.h>
#include <BLEServer.h>
#include <BLEUtils.h>
#include <BLE2902.h>

BLEServer *pServer = NULL;
BLEService *pService = NULL;
BLECharacteristic *pCharacteristic = NULL;
BLEAdvertising *pAdvertising = NULL;
#define SERVICE_UUID        "4fafc201-1fb5-459e-8fcc-c5c9c331914b"
#define CHARACTERISTIC_UUID "beb5483e-36e1-4688-b7f5-ea07361b26a8"


class MyCallbackHandler : public BLECharacteristicCallbacks {
  void onWrite(BLECharacteristic *pCharacteristic) {
    // 수신된 데이터 받아오기
    std::string value = pCharacteristic->getValue();
   
    if (value.length() > 0) {
      Serial.print("Receive");
      Serial.print("Received value: ");
      for (int i = 0; i < value.length(); i++) {
        Serial.print(value[i]);
      }
      Serial.println();
    }
  }
};

void setup() {
  Serial.begin(115200);
  Serial.println("Starting BLE...");
  // BLE 장치 이름
  BLEDevice::init("률류");
  // BLE 장치를 BLE 서버로 설정
  pServer = BLEDevice::createServer();

  // 미리 정의한 UUID로 서버의 서비스 생성    
  pService = pServer->createService(SERVICE_UUID);
  // UUID 전달, 읽기, 쓰시 속성으로 설정
  pCharacteristic = pService->createCharacteristic(
                                         CHARACTERISTIC_UUID,
                                         BLECharacteristic::PROPERTY_READ   |
                                         BLECharacteristic::PROPERTY_WRITE  |
                                         BLECharacteristic::PROPERTY_NOTIFY |
                                         BLECharacteristic::PROPERTY_INDICATE
                                       );

  pCharacteristic->setValue("Hello World says Neil");
  // characteristic의 특성을 설명하는 메타데이터를 설정할 수 있음
  // 이 문장이 없으면 notification이 제대로 이뤄지지 않는다
  // 데이터가 갱신될 때 마다 client가 적절한 callback을 수행하도록 하기 위해서 사용 필수 
  pCharacteristic->addDescriptor(new BLE2902());
  // 데이터 수신 콜백함수
  pCharacteristic->setCallbacks(new MyCallbackHandler());
  // 서비스 시작
  pService->start();

  // 광고 설정 객체 생성 후 pAdvertising 포인터 변수에 할당
  // advertising 생성
  pAdvertising = pServer->getAdvertising();
  // 클라이언트가 UUID를 통해 서비스를 식별하고 연결을 요청할 수 있음
  pAdvertising->addServiceUUID(SERVICE_UUID);
  // 스캔 기능하도록 설정
  pAdvertising->setScanResponse(false);
  // 아이폰 관련 연결 보조 설정(최대, 최소 주파수 대역폭 설정)
  pAdvertising->setMinPreferred(0x06);
  pAdvertising->setMaxPreferred(0x12);
  // advertising 시작
  pAdvertising->start();
  Serial.println("BLE server is ready.");
}

void loop() {
  // Your main loop code here

}