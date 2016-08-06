//
//  OSDeviceViewController.m
//  Omega-Splicer
//
//  Created by Charles Fournier on 13/07/16.
//  Copyright © 2016 Charles-Adrien Fournier. All rights reserved.
//

#import "OSDeviceViewController.h"

@interface OSDeviceViewController ()

@property (weak, nonatomic) IBOutlet UILabel *firstValueLabel;

@property (weak, nonatomic) IBOutlet UILabel *peripheralNameLabel;

@property (weak, nonatomic) IBOutlet UITextField *valueTextField;

@property (weak, nonatomic) IBOutlet UILabel *secondValueLabel;

@end

@implementation OSDeviceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Device information";
    self.peripheralNameLabel.text = self.peripheral.name;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:true];
    [self.bluetoothManager connectPeripheral:self.peripheral];
}

- (IBAction)updateCharacValue:(id)sender {
    CBCharacteristic *tmpCharac = [self.bluetoothManager getCharacteristicForUUID:[CBUUID UUIDWithString:UUID_READ_CHARACTERISTIC]];
    NSUInteger value = [self.valueTextField.text integerValue];
    NSLog(@"Value : %lu", value);
    NSData *newValue = [NSData dataWithBytes:&value length:sizeof(value)];
    [self.bluetoothManager writeValue:newValue forCharacteristic:tmpCharac];
}

#pragma mark OSBluetoothManagerDelegate

- (void)bluetoothManager:(OSBluetoothManager *)bluetoothManager didFailToSetupWithError:(OSError *)error {
    
}

- (void)bluetoothManagerIsReadyToScan:(OSBluetoothManager *)bluetoothManager {
    
}

- (void)bluetoothManager:(OSBluetoothManager *)bluetoothManager didDiscoverPeripheral:(CBPeripheral *)peripheral {
    
}

- (void)bluetoothManager:(OSBluetoothManager *)bluetoothManager didFailToConnect:(OSError *)error {
    
}

- (void)bluetoothManager:(OSBluetoothManager *)bluetoothManager didConnectToPeripheral:(CBPeripheral *)peripheral {
    if (self.peripheral != peripheral) {
        NSLog(@"Error");
    }
}

- (void)bluetootManager:(OSBluetoothManager *)bluetoothManager isReadyWithPeripheral:(CBPeripheral *)peripheral {
    CBCharacteristic *tmp = [self.bluetoothManager getCharacteristicForUUID:[CBUUID UUIDWithString:@"7F88EC10-D269-446A-B26D-6BA9AB70861F"]];
    NSLog(@"tmp : %@", tmp);
}

- (void)bluetoothManager:(OSBluetoothManager *)bluetoothManager didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic {
    NSData *dataValue = characteristic.value;
    NSUInteger index;
    [dataValue getBytes:&index length:sizeof(index)];
    
    if ([characteristic.UUID isEqual:[CBUUID UUIDWithString:UUID_WRITE_CHARACTERISTIC]]) {
        self.firstValueLabel.text = [NSString stringWithFormat:@"Value : %lu", index];
            } else if ([characteristic.UUID isEqual:[CBUUID UUIDWithString:UUID_READ_CHARACTERISTIC]]) {
                self.secondValueLabel.text = [NSString stringWithFormat:@"Value : %lu", index];
            }
    
//    if ([characteristic.UUID isEqual:[CBUUID UUIDWithString:@"67636659-E5E5-4A2A-92AE-BABDEC2C0E51"]]) {
//        NSLog(@"toto");
//    }
}

@end
