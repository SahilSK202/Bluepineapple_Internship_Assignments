import React from "react";
import { Link } from "react-router-dom";

const Product = ({ product }) => {
  return (
    <>
      <div className="card m-2 p-2">
        <Link to={`/product/${product._id}`}>
          <div className="card-image">
            <img
              src={product.image}
              alt={product.name}
              className="img-responsive"
            />
          </div>
          <div className="card-header">
            <div className="card-title h5">{product.name}</div>
            <div className="card-subtitle">{product.brand}</div>
          </div>
          <div className="card-body">
            <h3 className="prodprice">${product.price}</h3>
          </div>
        </Link>
      </div>
    </>
  );
};

export default Product;
