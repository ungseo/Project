# Typescript 에서 Type을 알려주는 방법



```javascript
let a = "hello"


a = "world"  //Ok

a = 12032 // 이것도 OK
```

##### 자바스크립트에서는 a의 타입에 상관없이 let a 를 재할당 할 수 있다.



#### 하지만 타입스크립트에서는 TypeChecker 가 있어서 타입을 지정해주면 개발자가 실수 하지 않도록 Type을 확인하고 일치하지 않을 시 오류를 뱉어준다.



```typescript
let a = "helllllo" // 자동으로 string 으로 인식(추론) 한다.

a = "everyone" // 이미 string 으로 인식하고있기 때문에 let a를 재할당하는데 문제없

a = 12302 // stirng이 아니기 때문에 typescript 에서 오류를 뱉음
```



##### 이렇게 타입스크립트에서 어지간한 것들은 추론해서 오류를 뱉어줌.

##### 개발자가 직접 type을 지정해서 코드를 짜려면 어떤 문법을 사용해야 할까?



```typescript
let a : boolean = "hello" // boolean 이란 타입을 선언했기 때문에 string을 할당할 시 오류 발생


let b : boolean = false // 이건 OK

let c : string = "hello" // 이건 OK

let d : number[] = []
d.push(1) // number 배열이기 때문에 가능!// d.push('1') 은 문자이기때문에 불가능
```



##### 이런식으로 type을 지정해주면서 코드를 짜면 더 확실하게 실수를 방지할 수 있다.

##### 하지만 TS의 TypeChecker 의 타입 추론 성능도 굉장히 우수하기 때문에 가독성이나 코드길이를 줄이기 위해서 Type을 굳이 안써줘도 정상적으로 작동하기 때문에 편리하다.


