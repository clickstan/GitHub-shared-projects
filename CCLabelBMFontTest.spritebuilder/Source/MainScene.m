#import "MainScene.h"

@implementation MainScene{
    CCLabelBMFont *label, *widthLabel;
    float labelWidth;
    CCButton *alignButton;
    NSString *labelString;
    CCTextField *inputText;
}

-(void) onEnter{
    [super onEnter];
    
    labelWidth=400;
    labelString=@"One two three four five";
    
    [self widthChanged];
    [self updateLabel];
}


-(void)setTextPressed{
    labelString=inputText.string;
    [self updateLabel];
}

-(void)clearPressed{
    labelString=@"";
    [self updateLabel];
}

-(void) alignPressed{
    //changes to next alignment
    CCTextAlignment nextAlign=label.alignment + 1;
    if(nextAlign>CCTextAlignmentRight){
        nextAlign=CCTextAlignmentLeft;
    }
    label.alignment=nextAlign;
    
    //change button
    switch (nextAlign) {
        case CCTextAlignmentLeft: alignButton.title=@"LEFT"; break;
            case CCTextAlignmentCenter: alignButton.title=@"CENTER"; break;
            case CCTextAlignmentRight: alignButton.title=@"RIGHT"; break;
    }
}
-(void) updateLabel{
    label.string=labelString;
    inputText.string=labelString;
}

-(void)widthPlusPressed{
    labelWidth+=10;
    [self widthChanged];
}
-(void)widthMinusPressed{
    labelWidth-=10;
    if(labelWidth<0){ //keep width +ve
        labelWidth=0;
    }
    [self widthChanged];
}

-(void) widthChanged{
    [label setWidth:labelWidth];
    widthLabel.string=[NSString stringWithFormat:@"%.0f",labelWidth];
    
    //updates the label bg to match new width
    CGSize s=label.parent.contentSize;
    [label.parent setContentSize:CGSizeMake(labelWidth, s.height)];
}
@end
