import { VisibilityFilters } from '../actions';

type Action = { type: 'SET_VISIBILITY_FILTER', filter: string };
type State = string;

const visibilityFilter = (state: State = VisibilityFilters.SHOW_ALL, action: Action): State => {
  switch (action.type) {
    case 'SET_VISIBILITY_FILTER':
      return action.filter;
    default:
      return state;
  }
};

export default visibilityFilter;