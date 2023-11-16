import { ChangeEvent } from "react";

interface SearchBarProps {
    filterText: string;
    inStockOnly: boolean;
    onFilterTextChange: (filterText: string) => void;
    onInStockChange: (inStockOnly: boolean) => void;
}

function SearchBar(props: SearchBarProps) {

  function handleFilterTextChange(e: ChangeEvent<HTMLInputElement>) {
    props.onFilterTextChange(e.target.value);
  }
  
  function handleInStockChange(e: ChangeEvent<HTMLInputElement>) {
    props.onInStockChange(e.target.checked);

    console.log(2);
  }

  return (
    <form>
      <input
        type="text"
        placeholder="Search..."
        value={props.filterText}
        onChange={handleFilterTextChange}
      />
      <p>
        <input
          type="checkbox"
          checked={props.inStockOnly}
          onChange={handleInStockChange}
        />
        {' '}
        Only show products in stock
      </p>
    </form>
  );
}

export default SearchBar;