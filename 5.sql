
CREATE TABLE capacities (
    level INT PRIMARY KEY NOT NULL ,
    capacity BIGINT NOT NULL
);

CREATE TABLE markets (
    m_id BIGINT PRIMARY KEY AUTO_INCREMENT ,
    m_name VARCHAR(255) NOT NULL ,
    m_address TEXT NOT NULL ,
    level INT NOT NULL ,
    m_score BIGINT NOT NULL ,
    FOREIGN KEY (level) REFERENCES capacities(level)
);

CREATE TABLE products (
    p_id BIGINT PRIMARY KEY AUTO_INCREMENT ,
    p_name VARCHAR(255) NOT NULL ,
    p_weight BIGINT NOT NULL
);

CREATE TABLE prices (
    p_id BIGINT ,
    m_id BIGINT ,
    PRIMARY KEY (p_id, m_id),
    price BIGINT NOT NULL ,
    FOREIGN KEY (p_id) REFERENCES products(p_id) ,
    FOREIGN KEY (m_id) REFERENCES markets(m_id)
);