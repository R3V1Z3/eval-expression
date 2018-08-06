# EvalExpression

![screenshot](https://raw.githubusercontent.com/Ugotsta/eval-expression/master/screenshot.png)

Simple expression evaluator example project for [Lazarus IDE](https://www.lazarus-ide.org/). The project includes a form with a couple text fields and a label. Users can enter math expressions in the first field and get evaluated results as they type.

Evaluations are handled through [TFPExpressionParser](http://wiki.lazarus.freepascal.org/How_To_Use_TFPExpressionParser) which is bundled with Lazarus.

The bulk of the code is as simple as this:

```pascal
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
```

## Usage

Simply clone the repo and open the project in Lazarus.
