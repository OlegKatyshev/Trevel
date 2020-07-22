import {SELECT_PAGE} from "../actions/actionTypes";

const iniState = { limit: 5, active: 1, pos: 0 };

export default function pagination (state = iniState, action) {

    switch (action.type){
        case SELECT_PAGE: return { ...state, active: action.active, pos: action.pos }
        default: return state;
    }
}