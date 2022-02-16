import React from "react";
import { Link } from "react-router-dom";

const Header = () => {
  return (
    <header className="navbar bg-dark p-5">
      <section className="navbar-section m-2">
        <Link to="/" className="navbar-brand mr-2 text-secondary">
          <img
            className="mr-2"
            src="./logo192.png"
            alt=""
            width="20"
            height="20"
          />
          SahilKavitake
        </Link>
        <Link to="/products" className="btn btn-link text-secondary">
          Products
        </Link>
      </section>
    </header>
  );
};

export default Header;
