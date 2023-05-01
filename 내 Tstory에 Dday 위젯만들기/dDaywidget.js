function calcDday(date) {
    const now = new Date();
    const today = new Date(now.getFullYear(), now.getMonth(), now.getDate());
    const base = new Date(date.substring(0,4), Number(date.substring(4,6))-1, date.substring(6,8));
    const dDay = (today - base) / 1000 / 60 / 60 / 24;
    if(dDay < 0) {
        return "D" + dDay;
    } else if(dDay == 0) {
        return "D-day!";
    } else {
        return "D+" + dDay;
    }
}

const rst = calcDday('20230405')
const pTag = document.querySelector('#DD');
DD.innerText = rst