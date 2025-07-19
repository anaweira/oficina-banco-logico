
-- Inserindo dados de exemplo

-- Clientes
INSERT INTO clientes (nome, telefone) VALUES 
('Ana Silva', '11999999999'),
('Carlos Souza', '21988888888');

-- Veículos
INSERT INTO veiculos (marca, modelo, placa, id_cliente) VALUES 
('Fiat', 'Uno', 'ABC1234', 1),
('Ford', 'Ka', 'XYZ5678', 2);

-- Mecânicos
INSERT INTO mecanicos (nome, especialidade, endereco) VALUES 
('João Mendes', 'Motor', 'Rua das Oficinas, 123'),
('Marcos Lima', 'Freios', 'Av. Mecânica, 456');

-- Equipes
INSERT INTO equipes () VALUES (), ();

-- Associação entre mecânicos e equipes
INSERT INTO equipe_mecanicos (id_equipe, id_mecanico) VALUES 
(1, 1),
(1, 2);

-- Ordens de Serviço
INSERT INTO ordens_servico (id_veiculo, id_equipe, data_emissao, data_entrega, valor, status) VALUES 
(1, 1, '2025-07-10', '2025-07-15', 500.00, 'Concluída'),
(2, 1, '2025-07-12', '2025-07-18', 300.00, 'Em andamento');

-- Serviços
INSERT INTO servicos (descricao, preco_mao_obra) VALUES 
('Troca de óleo', 100.00),
('Reparo no motor', 200.00);

-- Peças
INSERT INTO pecas (descricao, valor) VALUES 
('Filtro de óleo', 50.00),
('Correia dentada', 150.00);

-- Relação entre OS e serviços
INSERT INTO os_servicos (id_os, id_servico) VALUES 
(1, 1),
(1, 2),
(2, 1);

-- Relação entre OS e peças
INSERT INTO os_pecas (id_os, id_peca) VALUES 
(1, 1),
(1, 2),
(2, 1);
