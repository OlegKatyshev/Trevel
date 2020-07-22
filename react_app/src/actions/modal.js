import {OPEN_MODAL, CLOSE_MODAL} from "./actionTypes";

export function open(tour) {
    return {
        type: OPEN_MODAL,
        value: tour,
    }
}

export function close() {
    return {
        type: CLOSE_MODAL,
    }
}