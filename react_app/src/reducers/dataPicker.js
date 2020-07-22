import {CHANGE_DS, CHANGE_DE} from "../actions/actionTypes";

const iniState = {value_ds: '', value_de: ''};

export default function dataPicker(state = iniState, action) {

    switch (action.type){
        case CHANGE_DS: return { ...state, value_ds: action.value }
        case CHANGE_DE: return { ...state, value_de: action.value }
        default: return state;
    }
}