import { createSlice } from "@reduxjs/toolkit";

// выбранная вакансия

const initialState = {
    mode: "",
  };
const objectSlice = createSlice({
  name: "object",
  initialState,
  reducers: {
    setObject: (state, action) => {
      state.mode = action.payload;
    },
    setNull: (state) =>{
        state.mode = ""
    }
  },
});

export const { setObject,setNull } = objectSlice.actions;

export default objectSlice.reducer;