grammar hehe

//词法分析

FuncDec : '::' ;

Equal : 'is' ;

Minus : '-' ;

Dollar : '$';

OpenSquareBracket:  '[';
CloseSquareBracket: ']';


Assign : '=' ;
PlusAssign : '+=';
MinusAssign : '-=';

DoubleOpenSquareBracket: '[[';
DoubleCloseSquareBracket: ']]';

ShiftLeft:          '<<';

ShiftRight:         '>>';

Label: ('a'..'z' | 'A'..'Z' | '_')  ('a'..'z' | 'A'..'Z' | '0'..'9' | '_')*; //首字母不能是数字

VarName: '$' Label ;

DoFunc: Or Label ;   //在函数体里面如果接受到click时间，那么执行已Label为名字的函数

Or : '|' ;

Gte : 'gte' ;

Set : 'set' ;

Silently : '<<silently>>' ;
EndSilently: '<<endsilently>>' ;

Choice : 'choice' ;

If : 'if' ;

Delay : 'delay' ;

AndAnd : 'and' ;

//数字
fragment
Digit
    : [0-9]
    ;

Time : Int's' | Int 'm' ;

DelayTime = 'delay' Time ;

Int : Digit+ ;

True : 'true' ;

False : 'false' ;

Any : .+ ;


//语法分析
///////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////

//赋值操作符
assignmentOperator : '=' | '+=' | '-=' ;
operatorComparison : 'is' | 'gte' ;

number : Int ;

var : VarName ;

exp : number | 'false' | 'true' ;

varOrExp : var | exp ;

set_st : '<<set ' var assignmentOperator exp '>>' ;

if_st : '<<if ' varOrExp operatorComparison exp '>>' ;

silently_st : Silently set_st* EndSilently ;

// function主要用来显示和跳转

//调用匿名函数
showAll: '[' Any ']' ;
callFunction : '[[' Label ']]' | '[[' DelayTime DoFunc ']]' | '[[' Any DoFunc ']]' ;

//choice_st

// <<silently>>  <<endsilently>> 在中间的代码都不会影响显示, 目前只用来赋值


// <<set $toldname = 0>> set表达式用来给变量赋值
 
//[通话接入], [[launch]], 前一个我们可以认为是调用了一个匿名函数， 函数体是当中的字符串，后一个我们可以任务是调用了,名为launch的函数
