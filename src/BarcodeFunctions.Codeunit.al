codeunit 56601 "SK Barcode Functions"
{


    procedure EncodeFont(BarcodeStr: Code[50]): Text
    var
        BarcodeSymbology: Enum "Barcode Symbology 2D";
        BarcodeFontProvider: Interface "Barcode Font Provider 2D";
    begin
        BarcodeFontProvider := Enum::"Barcode Font Provider 2D"::IDAutomation2D;
        BarcodeSymbology := Enum::"Barcode Symbology 2D"::"QR-Code";
        exit(BarcodeFontProvider.EncodeFont(BarcodeStr, BarcodeSymbology));
    end;

    procedure TrimSerialNo(var SerialNo: Code[60])
    var
        i: Integer;
        j: Integer;
    begin
        if StrLen(SerialNo) > 50 then
            repeat
                for i := 2 to StrLen(SerialNo) do begin
                    if SerialNo[i] = '(' then begin
                        j := i;
                        i := StrLen(SerialNo);
                        break;
                    end;
                end;
                SerialNo := CopyStr(SerialNo, j);
            until StrLen(SerialNo) <= 50;
    end;
}