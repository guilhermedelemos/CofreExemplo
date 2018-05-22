package cofre;

import cucumber.api.java.Before;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.junit.Assert;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/**
 *
 * @author guilherme
 */
public class DestravadoSteps {

    SensorPorta sensorMock;
    Memoria memoriaMock;
    CofrePM cofrePM;

    public DestravadoSteps() {
        sensorMock = mock(SensorPorta.class);
        memoriaMock = mock(Memoria.class);
        cofrePM = new CofrePM(sensorMock, memoriaMock);
        when(sensorMock.travada())
                .thenReturn(Boolean.FALSE);
    }

    @Before
    public void doSomethingBefore() {
        when(sensorMock.fechada())
                .thenReturn(Boolean.TRUE);
    }

    @Given("^que eu entrei com o numero (\\d+)$")
    public void que_eu_entrei_com_o_numero(int arg1) throws Exception {
        cofrePM.pressButton(arg1);
    }

    @Given("^entrei com o numero (\\d+)$")
    public void entrei_com_o_numero(int arg1) throws Exception {
        cofrePM.pressButton(arg1);
    }

    @When("^eu pressionei o botao ok$")
    public void eu_pressionei_o_botao_ok() throws Exception {
        cofrePM.ok();
    }

    @Then("^o display deve mostrar uma mensagem vazia \"([^\"]*)\"$")
    public void o_display_deve_mostrar_uma_mensagem_vazia(String arg1) throws Exception {
        assertEquals(arg1, cofrePM.getDisplay());
        cofrePM.clear();
    }

    @When("^a porta esta aberta$")
    public void a_porta_esta_aberta() throws Exception {
        when(sensorMock.fechada())
                .thenReturn(Boolean.FALSE);
    }

    @When("^a porta esta fechada$")
    public void a_porta_esta_fechada() throws Exception {
        when(sensorMock.fechada())
                .thenReturn(Boolean.TRUE);
    }

    @Given("^que eu entrei com o numero (\\d+) e (\\d+)$")
    public void que_eu_entrei_com_o_numero_e(int arg1, int arg2) throws Exception {
        when(sensorMock.fechada())
                .thenReturn(Boolean.TRUE);
        cofrePM.pressButton(arg1);
        when(sensorMock.fechada())
                .thenReturn(Boolean.FALSE);
        cofrePM.pressButton(arg2);
        when(sensorMock.fechada())
                .thenReturn(Boolean.TRUE);
        cofrePM.pressButton(arg2);
    }

    @When("^eu pressionei o botao clear$")
    public void eu_pressionei_o_botao_clear() throws Exception {
        cofrePM.clear();
    }

    @Given("^que eu entrei com o numero (\\d+) com a porta aberta$")
    public void que_eu_entrei_com_o_numero_com_a_porta_aberta(int arg1) throws Exception {
        when(sensorMock.fechada())
                .thenReturn(Boolean.FALSE);
        cofrePM.pressButton(arg1);
    }

    @Given("^que eu entrei com o numero (\\d+) com a porta fechada$")
    public void que_eu_entrei_com_o_numero_com_a_porta_fechada(int arg1) throws Exception {
        when(sensorMock.fechada())
                .thenReturn(Boolean.TRUE);
        cofrePM.pressButton(arg1);
    }

    @When("^eu olhar para o display$")
    public void eu_olhar_para_o_display() throws Exception {
        assertFalse(cofrePM.getDisplay().isEmpty());
    }

    @Given("^que eu entrei com o numero (\\d+) em um display vazio$")
    public void que_eu_entrei_com_o_numero_em_um_display_vazio(int arg1) throws Exception {
        cofrePM.clear();
        when(sensorMock.fechada())
                .thenReturn(Boolean.TRUE);
        cofrePM.pressButton(arg1);
    }

    @Then("^o display deve mostrar a mensagem \"([^\"]*)\"$")
    public void o_display_deve_mostrar_a_mensagem(String arg1) throws Exception {
        assertEquals(arg1, cofrePM.getDisplay());
    }
}
