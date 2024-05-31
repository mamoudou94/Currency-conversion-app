//
//  ViewController.m
//  Currency-conversion-app
//
//  Created by Mamoudou Barry on 5/18/24.
//

#import "ViewController.h"
#import "CurrencyRequest/CRCurrencyRequest.h"
#import "CurrencyRequest/CRCurrencyResults.h"

@interface ViewController () <CRCurrencyRequestDelegate>
@property (nonatomic) CRCurrencyRequest *req;
@property (strong, nonatomic) IBOutlet UITextField *inputField;
@property (strong, nonatomic) IBOutlet UIButton *convertButton;

@property (strong, nonatomic) IBOutlet UILabel *currencyA;
@property (strong, nonatomic) IBOutlet UILabel *currencyB;
@property (strong, nonatomic) IBOutlet UILabel *currencyC;

@end

NSString* formatCurrency(double value) {
    return [NSString stringWithFormat:@"%.2f", value];
}

@implementation ViewController
- (IBAction)convertButton:(id)sender {
    self.convertButton.enabled = NO;
    self.req = [[CRCurrencyRequest alloc] init];
    self.req.delegate = self;
    [self.req start];
    
}

- (void)currencyRequest:(CRCurrencyRequest *)req retrievedCurrencies:(CRCurrencyResults *)currencies {
    self.convertButton.enabled = YES;
    double inputValue = [self.inputField.text floatValue];
    double euroValue = inputValue * currencies.EUR;
    double yenValue = inputValue * currencies.JPY;
    double gbpValue = inputValue * currencies.GBP;
    self.currencyA.text = formatCurrency(euroValue);
    self.currencyB.text = formatCurrency(yenValue);
    self.currencyC.text = formatCurrency(gbpValue);
}
@end
