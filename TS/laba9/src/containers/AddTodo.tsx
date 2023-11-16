import React, { useState } from 'react';
import { connect } from 'react-redux';
import { addTodo } from '../actions';

interface PropsFromRedux {
  dispatchAddTodo: (text: string) => void;
}

const AddTodo = ({ dispatchAddTodo }: PropsFromRedux): JSX.Element => {
  const [inputValue, setInputValue] = useState('');

  const handleSubmit = (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    if (!inputValue.trim()) {
      return;
    }
    dispatchAddTodo(inputValue);
    setInputValue('');
  };
  
  return (
    <div>
      <form onSubmit={handleSubmit}>
        <input value={inputValue} onChange={(e) => setInputValue(e.target.value)} />
        <button type="submit">Add Todo</button>
      </form>
    </div>
  );
};

const mapDispatchToProps = (dispatch: any): PropsFromRedux => ({
  dispatchAddTodo: (text: string) => dispatch(addTodo(text)),
});

export default connect(null, mapDispatchToProps)(AddTodo);