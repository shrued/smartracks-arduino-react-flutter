import React from "react";
import "./App.css";
import { database } from "./firebase";

class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      name: "",
      inventory: "",
      item: "",
      scale: "",
    };
    this.handleClick = this.handleClick.bind(this);
  }

  componentDidMount() {
    let names = database.ref("name/").on("value", (snapshot) => {
      var x = snapshot.val();
      this.setState({
        name: x,
      });
    });
    let inventories = database.ref("inventory/").on("value", (snapshot) => {
      var x = snapshot.val();
      this.setState({
        inventory: x,
      });
    });
    let items = database.ref("weight/").on("value", (snapshot) => {
      var x = snapshot.val();
      this.setState({
        item: x,
      });
    });
    let scales = database.ref("scale/").on("value", (snapshot) => {
      var x = snapshot.val();
      this.setState({
        scale: x,
      });
    });
  }

  handleClick() {
    var val = Math.floor(
      parseInt(this.state.scale) / parseInt(this.state.item)
    );
    let inventories = database.ref().update({ inventory: val });
  }

  render() {
    return (
      <div className="App">
        <header className="App-header">
          <p>Name: {this.state.name}</p>
          <p>Inventory: {this.state.inventory}</p>
          <p>Item Weight: {this.state.item}</p>
          <p>Scale Weight: {this.state.scale}</p>
          <button onClick={this.handleClick}>Refresh</button>
        </header>
      </div>
    );
  }
}

export default App;
