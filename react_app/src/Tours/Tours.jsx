import React from 'react';
import {connect} from 'react-redux';
import './Tours.scss';
import Modal from "../Modal/Modal.jsx";
import {open} from "../actions/modal.js";

class Tours extends React.Component {

    constructor(props){
        super(props);
    }

    getUrl(tour){

        let country = tour.hotel.country.eng_name;
        let hotel = tour.hotel.id;

        let imgId = Math.floor(Math.random() * tour.hotel.images.length);
        let img = tour.hotel.images[imgId].name;

        return `/image/${country}/${hotel}/${img}.jpg`;
    }

    setDate(date){
        if (date.length){
            date = date.replace(/[^\d]/g,'.').split('.');
            date = date.reverse().join('.');
        }
        return date;
    }

    setPrice(tour){

       let price = tour.price.replace(/[^+\d\.]/g, '');
       if(tour.sell){

           let new_price = price - ( price * (tour.sell/100) );

           return <div className="price">
               <span className="old-price">{price}</span>
               <span className="sell">-{tour.sell}%</span>
               <span className="new-price"><span> = </span>{new_price.toFixed(2)} руб</span>
           </div>
       }
       else{
           return <div className="price">{price} руб</div>
       }
    }

    renderTour(){

        return this.props.tours.data.map((tour, id) => {
            return <div className="tour" key={id}>
                        <div className="info-tour">
                            <div className="head">
                                <div className="country">{tour.hotel.country.name}</div>
                                <div className="city">{tour.hotel.city.name}</div>
                            </div>
                            <img src={this.getUrl(tour)} alt=""/>
                            <div className="count">{this.setPrice(tour)}</div>
                            <div className="date">
                                <div className="date_s">с {this.setDate(tour.date_s)}</div>
                                <div className="date_e">по {this.setDate(tour.date_e)}</div>
                            </div>
                            <div className="info-hotel">
                                <div className="name">{tour.hotel.name}</div>
                            </div>
                        </div>
                        <div className="open-tour">
                            <button type="button" onClick={this.props.openModal.bind(this, tour)}>Интересно</button>
                        </div>
                    </div>
        })
    }

    render (){

        return (
            (this.props.tours.data.length) ?
                <React.Fragment>
                    <div className="tours-container">
                        { this.renderTour() }
                    </div>
                    <Modal/>
                </React.Fragment>
                : null
        );
    }
}
function mapStateToProps(reduxState) {
    return {
        tours: reduxState.search.tours,
    }
}

function mapActionToProps(dispath) {
    return {
        openModal: (tour) => dispath(open(tour)),
    }
}

export default connect(mapStateToProps,mapActionToProps)(Tours);
