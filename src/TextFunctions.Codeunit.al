codeunit 56700 "SK2 Text Functions"
{
    local procedure CharType(c: Char): Text[1]
    var
        fc: Text;
    begin
        fc := format(c);
        case true of
            fc in ['a' .. 'z', 'A' .. 'Z']:
                exit('a');
            fc in ['0' .. '9']:
                exit('0');
            else
                exit(Format(c))
        end;
    end;

    procedure AsSNFormat(s: Text) SNFormat: Text
    var
        i: Integer;
    begin
        for i := 1 to StrLen(s) do
            SNFormat += CharType(s[i]);
    end;
}