## 実現したいこと
オブジェクト内の複数のフィールドの値をもとにバインド用プロパティを実装する ( ※ 1 )

## 問題点
getter メソッドが動かない → オブジェクト内のフィールドの値が画面へ反映されない ( ※ 2 )

## 問題の原因
バインドしている getter メソッドを「プロパティ変更イベント」チェーンに登録できていなかったため ( ※ 3 )

## 対処
当該プロパティを構成する各フィールドの setter メソッドに「プロパティ変更イベント」を Fire させる記述を付加する ( ※ 4 )

***
  
※ 1  
完成イメージ : testObject2.value12, testObject2.value13, testObject2.value23  
初期のコード : testObject1.value12, testObject1.value13, testObject1.value23  
  
※ 2  
testObject1.value12, testObject1.value13, testObject1.value23 がバインドされた TextInput は
value1 && value2 / value1 && value3 / value2 && value3 の値の変動を反映させることができず、CheckBox の on / off と値の同期が取れていない  
  
※ 3  
getter および setter は、ランタイム ( コンパイラ？ ) により「メソッド」ではなく「イベント」として扱われる。一つのフィールドに対し、オーソドックスな getter / setter を実装すると ( testObject1.value1 など ) これはランタイム ( もしくはコンパイラ ) により、自動的にイベントとして扱われ、バインド機構も getter イベント・setter イベントに同期するよう動作する  
[参考 : このページの "Not changing the default propertyChange event constant"](https://www.adobe.com/devnet/flex/articles/databinding_pitfalls.html)

※ 4  
testObject2.value12, testObject2.value13, testObject2.value23 がバインドされた TextInput は
value1 && value2 / value1 && value3 / value2 && value3 の値の変動を反映させることができている  
プロパティを構成するフィールドへの setter 全て ( value1 への setter & value2 への setter ) で当該 getter へのイベント呼び出し ( value12 への getter ) を記述することで、フィールドの値 ( value1, value2 ) 変更に同期してプロパティの値 ( value12 ) の再評価をさせることができる  
  
***
  
余談  
バインド式に記述する「@」の意味が以下に記されている  
[参考 : このページの "Using two-way data binding for unsupported properties"](https://www.adobe.com/devnet/flex/articles/databinding_pitfalls.html)  
testObject3 へのバインディングは「@」が記述されていないので、CheckBox の on / off に対し、TextInput は無反応になっている  
画面への入力で setter イベントを Fire させたいときは、「@」を書く必要がある  

***
  
## 結論  
WPF の方が出来がいいれす (^q^)
