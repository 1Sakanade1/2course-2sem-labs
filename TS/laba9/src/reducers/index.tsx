import todos from './todos';
import visibilityFilter from './visibilityFilter';
import { createStore, combineReducers } from 'redux';
import { composeWithDevTools } from 'redux-devtools-extension';

export default createStore(combineReducers({todos, visibilityFilter}), composeWithDevTools()); 