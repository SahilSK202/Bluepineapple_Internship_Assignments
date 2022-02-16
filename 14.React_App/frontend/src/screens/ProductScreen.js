import React from "react";
import { Link, useParams } from "react-router-dom";
import products from "../products";

const ProductScreen = () => {
  const { id } = useParams();
  const product = products.find((p) => p._id === id);
  return (
    <>
      <Link to="/products">
        <button className="btn btn-primary btn-lg my-2">Back</button>
      </Link>
      <div className="rows">
        <div className="row m-2">
          <div className="columns">
            <div className="col col-6">
              <img
                src={product.image}
                alt={product.name}
                className="img-responsive"
              />
            </div>
            <div className="col col-5">
              <table class="table table-hover">
                <thead>
                  <tr>
                    <th colspan="2">
                      <h3>{product.name}</h3>
                    </th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>Brand:</td>
                    <td>{product.brand}</td>
                  </tr>
                  <tr>
                    <td>Description:</td>
                    <td>{product.description}</td>
                  </tr>
                  <tr>
                    <td>Price:</td>
                    <td className="prodprice">$ {product.price}</td>
                  </tr>
                </tbody>
              </table>
              <button class="btn btn-lg btn-long my-2 bg-warning text-dark">
                Buy Now
              </button>
            </div>
          </div>
        </div>
      </div>
    </>
  );
};

export default ProductScreen;
