import React from 'react';
import {connect} from 'react-redux';
import {change_de, change_ds, selectCountry, getCountries, getTours} from '../actions/search.js'
import './Search.scss';
import DatePicker from '../DatePicker/DatePicker.jsx';

class Search extends React.Component {


    constructor(props){
        super(props);
        this.props.getCountries();
    }

    changeDateStart(date_pikcer, date){

        let d = `${date.date}.${date.month}.${date.year}`;
        this.props.change_ds(d);
        date_pikcer.close();
    }

    changeDateEnd(date_pikcer, date){

        let d = `${date.date}.${date.month}.${date.year}`;
        this.props.change_de(d);
        date_pikcer.close();
    }

    selectCountry(e){
        this.props.change_country(e.target.value)
    }

    getTours(e){
        e.preventDefault();
        this.props.getTours();
    }

    renderError(name){

        let errorExist = Object.keys(this.props.tours.errors).length;
        let message = null;
        if(errorExist && !this.props[name]) {
            message = (this.props.tours.errors.hasOwnProperty(name)) ? this.props.tours.errors[name] : null;
            if (Array.isArray(message)) message = message[0];
        }

        return (errorExist && message) ? <p className="err-msg">{message}</p> : null;
    }

    render () {
        return (
            <form action="" className="search" onSubmit={(e)=> e.preventDefault()}>
                <div className="date-inp">
                    <label htmlFor="">Вылет с</label>
                    <DatePicker value={ this.props.value_ds } key={1} change={this.changeDateStart.bind(this)}/>
                    {this.renderError('value_ds')}
                </div>
                <div className="date-inp">
                    <label htmlFor="">Вылет по</label>
                    <DatePicker value={ this.props.value_de } key={2} change={this.changeDateEnd.bind(this)}/>
                    {this.renderError('value_de')}
                </div>
                <div className="search-country">
                <label htmlFor="">Страна</label>
                    <select className="search-inp" name="search-inp" value={this.props.country}  onChange={this.selectCountry.bind(this)}>
                        { this.props.countries.map((country, i) =>{ return <option key={i} value={country.id} >{country.name}</option> }) }
                    </select>
                    <button className="btn-search" onClick={this.getTours.bind(this)}>Поиск</button>
                </div>
            </form>
        );
    }
}

function mapStateToProps(reduxState) {
    return {
        value_ds: reduxState.dataPicker.value_ds,
        value_de: reduxState.dataPicker.value_de,
        country: reduxState.search.valueCountry,
        countries: reduxState.search.countries,
        tours: reduxState.search.tours,
    }
}
function mapActionToProps(dispatch) {
    return {
        change_ds: (value) => dispatch(change_ds(value)),
        change_de: (value) => dispatch(change_de(value)),
        change_country: (value) => dispatch(selectCountry(value)),
        getCountries: () => dispatch(getCountries()),
        getTours: () => dispatch(getTours()),
    }
}
export default connect(mapStateToProps, mapActionToProps)(Search);