import { connect } from 'react-redux';
import { toggleTodo } from '../actions';
import TodoList from '../components/TodoList';
import { VisibilityFilters } from '../actions';

interface Todo {
  id: number;
  text: string;
  completed: boolean;
}

interface Props {
  todos: Todo[];
  toggleTodo: (id: number) => void;
}

const getVisibleTodos = (todos: Todo[], filter: string): Todo[] => {
  switch (filter) {
    case VisibilityFilters.SHOW_ALL:
      return todos;
    case VisibilityFilters.SHOW_COMPLETED:
      return todos.filter((t) => t.completed);
    case VisibilityFilters.SHOW_ACTIVE:
      return todos.filter((t) => !t.completed);
    default:
      throw new Error('Unknown filter: ' + filter);
  }
};

const mapStateToProps = (state: { todos: Todo[], visibilityFilter: string }): { todos: Todo[] } => ({
    todos: getVisibleTodos( 
      state.todos,
      state.visibilityFilter
    ),
});

const mapDispatchToProps = (dispatch: Function): { toggleTodo: (id: number) => void } => ({
    toggleTodo: (id: number) => dispatch(toggleTodo(id)),
});
export default connect<Props, {toggleTodo: (id: number) => void}, {}, {todos: Todo[]}>(
    mapStateToProps as any,
    mapDispatchToProps
)(TodoList);