import {SEND_REQ, SEND_REQ_MAIL, SEND_REQ_NAME, SEND_REQ_PHONE, SEND_F_CLEAR} from "../actions/actionTypes";

const iniState = {
    data:{
        status: null,
        message: '',
    },
    errors: {},
    email: '',
    name: '',
    phone: ''
};

export default function send (state = iniState, action) {

    switch (action.type){
        case SEND_REQ:
        return {...iniState,
            errors: action.value.errors,
            data: {
                status: action.value.status,
                message: action.value.message
            }
        }
        case SEND_REQ_MAIL:
            return {...state,
                email: action.value,
                errors: {...state.errors, email: null}
            }
        case SEND_REQ_NAME:
            return {...state,
                name: action.value,
                errors: {...state.errors, name: null}
            }
        case SEND_REQ_PHONE:
            return {...state,
                phone: action.value,
                errors: {...state.errors, phone: null}
            }
        case SEND_F_CLEAR: return {...iniState }
        default: return state;
    }
}
