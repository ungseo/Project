# Object 에서 Type을 지정하는 방법을 알아보자



```ts
const playerWoong = {
    name: 'WoongSeo',
    age: 29,
}
```



## 위의 코드에서 playerWoong.name = 321 로 당연히 안바꿔진다. String 으로 추론된 name에 number를 넣으려고 했기 때문에



# playerWoong 을 object 라고 TS에게 알려주는 방법은 뭘까??

#### 1번 :

```ts
const playerWoong : object = {
    name: 'WoongSeo',
    age: 28,
}
```



#### 2번 :

```ts
const playerWoong : {
    name: string
    age: number
} = {
    name: 'WoongSeo',
    age: 28,
}
```



1번은 저번 글에서 봤던 방식대로 한 것처럼 보인다. 

2번은 JS 를 배웠다면 object를 표현할때 {}로 보통 표현한다는 것을 안다. 그리고 안에 속성들의 type을 직접 지정해줬다.



*정답은 2번 (이유는;;;;;;;;;) 그냥 문법이니 외우자*



### Object 내의 속성을 선택적(Optional) 하게 만드는 방법은?



player라는 객체에 항상 age가 있어야 할 필요는 없을 수도있다. 만약 name 속성은 필수이고, age속성은 입력된 부분만 받고 싶다면 어떤식으로 해야할까?? 

TS는 까다롭다.

```ts
const playerWoong : {
    name: string
    age: number
} = {
    name: 'WoongSeo'
}
```

위의 2번 코드에서 age를 빼버리면 TS에서 오류를 뱉는다. age에 number를 선언해줬는데 없기 때문,

이러한 오류를 예외적으로 처리하기 위해 사용하는 방법이 있다.



```ts
const playerWoong : {
    name: string
    age?: number
} = {
    name: 'WoongSeo'
}
```



##### 이런식으로 age(옵션으로 만들 속성)에 ? 를 붙여주면 optional 하게 인식할 수 있고, 빠뜨려도 오류를 뱉지 않도록 예외속성을 만들 수 있다.



### 만약 player 속성이 필요한 객체가 여러명이라면??



```ts
const playerWoong : {
    name: string
    age?: number
} = {
    name: 'WoongSeo'
}

const playerCheolsu : {
    name: string
    age?: number
} = {
    name: 'Cheolsu',
    age: 25,
}

const playerMinji : {
    name: string
    age?: number
} = {
    name: 'Minji',
    age: 22,
}

const playerJiwon : {
    name: string
    age?: number
} = {
    name: 'Jiwon',
}
```



##### 일일이 name과 age? 의 타입을 계속 써줘야 할까?? 이럴거면 안썼지 ㅋㅋ

##### 이럴때 사용하는게 Alias



```ts
type Player = {
    name: string,
    age?: number,
}

const woong : Player = {
    name: "Woong",
}

const Cheolsu : Player = {
    name: "Cheolsu",
    age: 28,
}

const Minji : Player = {
    name: 'Minji',
    age: 22,
}

const Jiwon : Player = {
    name: 'Jiwon',
}
```



이런식으로 tyep + **이름** =  { 속성 type 설정 } **이름의 첫문자는 대문자로**



type을 일괄 적용할 수 있다. string 이나 number 같은 간단한 속성도 Alias를 사용 할 수 있음.



##### 이런식으로 코드를 더 깔끔하고 덜 타이핑 하도록 사용 할 수 있다.


