import firebase from "firebase/app";
import "firebase/database";

let firebaseConfig = {
  apiKey: "AIzaSyBlnL0blzUT24C6kDzXWhE3Coi_NMdczW4",
  authDomain: "trial-1311f.firebaseapp.com",
  databaseURL: "https://trial-1311f-default-rtdb.firebaseio.com",
  projectId: "trial-1311f",
  storageBucket: "trial-1311f.appspot.com",
  messagingSenderId: "816818477094",
  appId: "1:816818477094:web:794e956fcea057ed06eee7",
  measurementId: "G-JP1VB22WYH",
};

firebase.initializeApp(firebaseConfig);

export const database = firebase.database();
