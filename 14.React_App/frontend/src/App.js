import React from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import Header from "./components/Header";
import Footer from "./components/Footer";
import WelcomeScreen from "./screens/WelcomeScreen";
import HomeScreen from "./screens/HomeScreen";
import ProductScreen from "./screens/ProductScreen";

const App = () => {
  return (
    <Router>
      <Header />
      <main className="p-2">
        <div className="container">
          <Routes>
            <Route exact path="/" element={<WelcomeScreen />} />
            <Route exact path="/products" element={<HomeScreen />} />
            <Route exact path="/product/:id" element={<ProductScreen />} />
          </Routes>
        </div>
      </main>
      <Footer />
    </Router>
  );
};

export default App;
