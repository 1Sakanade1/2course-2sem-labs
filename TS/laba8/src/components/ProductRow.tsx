interface ProductRowProps {
    product: {
      name: string;
      price: string;
      stocked: boolean;
    };
}

function ProductRow(props: ProductRowProps) {

  const product = props.product;
  const name = product.stocked ?
  product.name : <span style={{color: 'red'}}> {product.name} </span>;

  return(
    <tr>
      <td>{name}</td>
      <td>{product.price}</td>
    </tr>
  );
}

export default ProductRow;