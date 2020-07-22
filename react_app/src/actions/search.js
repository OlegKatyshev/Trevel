import {CHANGE_DS, CHANGE_DE, SELECT_COUNTRY, LOAD_COUNTRIES, LOAD_TOUR} from "./actionTypes";

export function change_ds(value) {
    return {
        type: CHANGE_DS,
        value: value
    }
}

export function change_de(value) {
    return {
        type: CHANGE_DE,
        value: value
    }
}

export function selectCountry(value) {
    return {
        type: SELECT_COUNTRY,
        value: value
    }
}

export function getCountries() {

    return (dispatch) => {
        request('/tur/countries', dispatch, LOAD_COUNTRIES, {method: 'GET'})
    }
}

export function getTours() {

    return (dispatch, getState) => {

        let data = {
            ...getState().dataPicker,
            country: getState().search.valueCountry,
            page: getState().pagination.active,
        };

        request(
            "/tur/tours",
            dispatch,
            LOAD_TOUR,
            {
               method: 'POST',
               body: getFormData(data),
            }
        );
    }
}

function getFormData(params) {

    let data = new FormData();
    for(let key in params){
        data.append(key, params[key]);
    }
    return data;
}

async function request(url, dispatch, type, options) {

    let response = await fetch(url, options);
    let json = await response.json();
    dispatch({
        type: type,
        value: json
    })
}
