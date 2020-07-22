import {SELECT_PAGE} from "./actionTypes";

export function selectPage (state) {

    return {
        type: SELECT_PAGE,
        ...state
    }
}

