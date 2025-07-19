
-- Criação do esquema lógico para oficina mecânica

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20)
);

CREATE TABLE veiculos (
    id_veiculo INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50),
    modelo VARCHAR(50),
    placa VARCHAR(10) UNIQUE,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE mecanicos (
    id_mecanico INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    especialidade VARCHAR(100),
    endereco VARCHAR(150)
);

CREATE TABLE equipes (
    id_equipe INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE equipe_mecanicos (
    id_equipe INT,
    id_mecanico INT,
    PRIMARY KEY (id_equipe, id_mecanico),
    FOREIGN KEY (id_equipe) REFERENCES equipes(id_equipe),
    FOREIGN KEY (id_mecanico) REFERENCES mecanicos(id_mecanico)
);

CREATE TABLE ordens_servico (
    id_os INT AUTO_INCREMENT PRIMARY KEY,
    id_veiculo INT,
    id_equipe INT,
    data_emissao DATE,
    data_entrega DATE,
    valor DECIMAL(10,2),
    status VARCHAR(50),
    FOREIGN KEY (id_veiculo) REFERENCES veiculos(id_veiculo),
    FOREIGN KEY (id_equipe) REFERENCES equipes(id_equipe)
);

CREATE TABLE servicos (
    id_servico INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100),
    preco_mao_obra DECIMAL(10,2)
);

CREATE TABLE pecas (
    id_peca INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100),
    valor DECIMAL(10,2)
);

CREATE TABLE os_servicos (
    id_os INT,
    id_servico INT,
    PRIMARY KEY (id_os, id_servico),
    FOREIGN KEY (id_os) REFERENCES ordens_servico(id_os),
    FOREIGN KEY (id_servico) REFERENCES servicos(id_servico)
);

CREATE TABLE os_pecas (
    id_os INT,
    id_peca INT,
    PRIMARY KEY (id_os, id_peca),
    FOREIGN KEY (id_os) REFERENCES ordens_servico(id_os),
    FOREIGN KEY (id_peca) REFERENCES pecas(id_peca)
);
