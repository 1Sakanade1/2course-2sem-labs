import ProductRow from "./ProductRow";
import ProductCategoryRow from "./ProductCategoryRow";
import Style from "./styles.module.css";

interface ProductTableProps {
    filterText: string;
    inStockOnly: boolean;
    products: {
      category: string;
      price: string;
      stocked: boolean;
      name: string;
    }[];
  }

function ProductTable(props: ProductTableProps) {
    const { filterText, inStockOnly, products } = props;
  
    const rows: JSX.Element[] = [];
    let lastCategory: string | null = null;
  
    products.forEach((product) => {
      if (product.name.indexOf(filterText) === -1) {
        return;
      }
      if (inStockOnly && !product.stocked) {
        return;
      }
      if (product.category !== lastCategory) {
        rows.push(
          <ProductCategoryRow
            category={product.category}
            key={product.category} />
        );
      }
      rows.push(
        <ProductRow
          product={product}
          key={product.name}
        />
      );
      lastCategory = product.category;
    });
  
    return (
      <table className={Style.table}>
        <thead>
          <tr>
            <th>Name</th>
            <th>Price</th>
          </tr>
        </thead>
        <tbody>{rows}</tbody>
      </table>
    );
}
  
export default ProductTable;