import { Link } from "react-router-dom";

const AboutPage = () => {
    return (
        <><section>
            <h1>Links</h1>
            <br />
            <h2>Public</h2>
            <Link to="/login">Login</Link>
            <Link to="/register">Register</Link>
            <Link to="/aboutpage">About</Link>
            <br />
            <h2>Private</h2>
            <Link to="/">Home</Link>
            <Link to="/offer">Offers</Link>
            <Link to="/editor">Editors Page</Link>
            <Link to="/admin">Admin Page</Link>
        </section><section>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pellentesque nec nunc eu volutpat. Nulla dapibus tortor lacus, vel rhoncus lectus mollis vitae. Phasellus ut rutrum enim. Etiam bibendum aliquam massa, nec mattis tortor. Morbi ultricies tincidunt augue, eget vehicula tellus fermentum in. Etiam sed euismod nibh. Aliquam commodo est eget quam dapibus, nec tincidunt odio vehicula. Praesent sollicitudin iaculis nisi et vestibulum. Nunc semper sapien erat, nec consequat odio egestas a. Quisque finibus volutpat metus. Praesent consequat tincidunt lacus eget gravida. Proin lacinia tellus mauris, porttitor ultricies est tristique ut. Nam pulvinar pretium vestibulum. Aenean quis est aliquet, efficitur eros at, dapibus nunc. Nunc venenatis pharetra rhoncus. Phasellus fermentum turpis sed nisi molestie, vel hendrerit orci ullamcorper.</p>
            </section></>
    )
}

export default AboutPage;
