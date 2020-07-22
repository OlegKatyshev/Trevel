import React from 'react';
import './Slider.scss';


class Slider extends React.Component {

    constructor(props){
        super(props);
        this.state = {
            active: 0
        }
    }

    renderImg(tour){

        let country = tour.hotel.country.eng_name;

        let images = tour.hotel.images.map((img, i)=>{

            let className = (i == this.state.active) ? 'active' : null;
            return <img className={className} key={i} src={`/image/${country}/${img.id_hotel}/${img.name}.jpg`} />
        });
        return images;
    }

    next(){
        if(this.state.active < this.props.tour.hotel.images.length - 1){
            this.setState({active: this.state.active + 1})
        }
        else{
            this.setState({active: 0})
        }
    }

    prev(){
        if(this.state.active > 0){
            this.setState({active: this.state.active - 1})
        }
        else{
            this.setState({active: this.props.tour.hotel.images.length - 1})
        }
    }
    render(){
        return (
            (this.props.tour.hotel.images.length) ?
            <div className="slider-md">
                <div className="next" onClick={this.next.bind(this)}>
                    <i className="fa fa-angle-double-left" />
                </div>
                <div className="img-container">
                    {this.renderImg(this.props.tour)}
                </div>
                <div className="prev" onClick={this.prev.bind(this)}>
                    <i className="fa fa-angle-double-right" />
                </div>
            </div>
            : null
        )
    }
}

export default Slider