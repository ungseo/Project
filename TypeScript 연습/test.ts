const playerWoong : {
    name: string
    age?: number
} = {
    name: 'ungseo',
}


type Player = {
    name: string,
    age?: number,
}

function MakePlayer(name : string) : Player {
    return {
        name
    }
}

MakePlayer('woongseo')

console.log('hi')