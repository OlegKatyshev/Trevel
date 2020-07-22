import {OPEN_MODAL, CLOSE_MODAL} from "../actions/actionTypes";

const iniState = {
    show: false,
    tour: null
};

export default function modal (state = iniState, action) {

    switch (action.type){
        case OPEN_MODAL: return {show: true, tour: action.value };
        case CLOSE_MODAL: return {show: false, tour: null };
        default: return state;
    }
}