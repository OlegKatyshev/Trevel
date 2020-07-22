import {SELECT_COUNTRY, LOAD_COUNTRIES, LOAD_TOUR } from "../actions/actionTypes";

const iniState = {
    valueCountry: '0',
    countries: [{id:0, name: ''}],
    tours: {
        pages: [],
        data: [],
        errors:{}
    },
};

export default function search (state = iniState, action) {

    switch (action.type){
        case SELECT_COUNTRY: return {...state, valueCountry: action.value }
        case LOAD_COUNTRIES: return {...state, countries: action.value }
        case LOAD_TOUR: return {...state, tours: action.value }
        default: return state;
    }
}

