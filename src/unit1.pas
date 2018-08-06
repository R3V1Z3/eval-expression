unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, fpexprpars;

type

  { Teval }

  Teval = class(TForm)
    Result: TEdit;
    Expression: TEdit;
    Label1: TLabel;
    procedure ExpressionChange(Sender: TObject);
  private

  public

  end;

var
  eval: Teval;

implementation

{$R *.lfm}

{ Teval }

procedure Teval.ExpressionChange(Sender: TObject);
var
  FParser: TFPExpressionParser;
  resultValue: Double;
  exp: String;
begin
  exp := Expression.Text;
  if exp = '' then exp := '0';
  FParser := TFPExpressionParser.Create(nil);
  try
    FParser.BuiltIns := [bcMath];
    FParser.Expression := exp;
    resultValue := ArgToFloat(FParser.Evaluate);
    Result.caption := resultValue.ToString();
    Result.Color := clCream;
    FParser.Free;
  except
    Result.caption := 'nil';
    Result.Color := clYellow;
    FParser.Free;
  end;
end;

end.

