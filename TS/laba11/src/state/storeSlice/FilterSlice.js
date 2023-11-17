import { createSlice } from "@reduxjs/toolkit";

// режимы поиска

const initialState = {
  modeCountry: "",
  modeSchedule: "Not",
  modeEmployment: "Not",
  modeBetween: "Not",
  modeIncome: ""
};

const FilterSlice = createSlice({ // определяет объект инициализации состояния initialState
  name: "SearchMode",
  initialState, // начальное состояние
  reducers: { // массив редьюсеров
    setCountry(state,action){
        state.modeCountry = action.payload
    },
    setSchedule(state,action){
        state.modeSchedule = action.payload
    },
    setEmployment(state,action){
        state.modeEmployment = action.payload
    },
    setBetween(state,action){
        state.modeBetween = action.payload
    },
    setIncome(state,action){
        state.modeIncome = action.payload
    }
  },
});

export const { setCountry,setBetween,setEmployment,setIncome,setSchedule } = FilterSlice.actions; // создание action с помощью createSlice 
export default FilterSlice.reducer; // reducer созданный CreateSlice