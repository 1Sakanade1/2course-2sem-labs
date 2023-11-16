import React from "react";

interface ProductCategoryRowProps {
    category: string;
}

function ProductCategoryRow(props: ProductCategoryRowProps) {

  const { category }  = props;

  return(
    <tr>
      <th colSpan={2}>{ category }</th>
    </tr>
  );
}

export default ProductCategoryRow;