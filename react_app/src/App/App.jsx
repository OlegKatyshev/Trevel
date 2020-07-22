import React from 'react';
import {connect} from 'react-redux';
import './App.scss';
import Search from '../Search/Search.jsx'
import Tours from '../Tours/Tours.jsx'
import Pagination from '../Pagination/Pagination.jsx'

class App extends React.Component {

    constructor(props){
        super(props);
    }

    render (){

        return (
            <div className="App">
                <Search/>
                <Tours/>
                <Pagination/>
            </div>
        );
    }
}

function mapStateToProps(reduxState) {
    return {
    }
}

function mapActionToProps(dispath) {
    return {
    }
}

export default connect(mapStateToProps,mapActionToProps)(App);