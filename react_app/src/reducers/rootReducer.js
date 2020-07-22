import { combineReducers } from 'redux';
import dataPicker from './dataPicker.js';
import search from './search.js';
import pagination from './pagination.js';
import modal from './modal.js';
import send from './send.js';

export default combineReducers({dataPicker, search, pagination, modal, send})