import React from 'react'
import FilterLink from '../containers/FilterLink'
import { VisibilityFilters } from '../actions'

const Footer: React.FC = () => (
  <div>
    <span>Show: </span>
    <FilterLink filter={VisibilityFilters.SHOW_ALL} to="/">
      All
    </FilterLink>
    <FilterLink filter={VisibilityFilters.SHOW_ACTIVE} to="/active">
      Active
    </FilterLink>
    <FilterLink filter={VisibilityFilters.SHOW_COMPLETED} to="/completed">
      Completed
    </FilterLink>
  </div>
);

export default Footer;
