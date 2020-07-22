import {SEND_REQ, SEND_REQ_MAIL, SEND_REQ_NAME, SEND_REQ_PHONE, SEND_F_CLEAR} from "./actionTypes";


export function setName(value){
    return {
        type:SEND_REQ_NAME,
        value:value
    }
}

export function setEmail(value){
    return {
        type:SEND_REQ_MAIL,
        value:value
    }
}

export function setPhone(value){
    return {
        type: SEND_REQ_PHONE,
        value:value
    }
}

export function clearSendForm() {
    return {
        type: SEND_F_CLEAR,
    }
}

export function send() {

    return (dispatch, getState) => {

        let data = {
            name: getState().send.name,
            phone: getState().send.phone,
            email: getState().send.email
        };
        request('/tur/send', dispatch, SEND_REQ, {method: 'POST', body: getFormData (data)})
    }
}

async function request(url, dispatch, type, options) {

    let response = await fetch(url, options);
    let json = await response.json();
    dispatch({
        type: type,
        value: json
    })
}

function getFormData(params) {

    let data = new FormData();
    for(let key in params){
        data.append(key, params[key]);
    }
    return data;
}