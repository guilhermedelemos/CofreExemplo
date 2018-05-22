package cofre;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

public class TravadoSteps {

    SensorPorta sensorMock;
    Memoria memoriaMock;
    CofrePM cofrePM;

    public TravadoSteps() {
        sensorMock = mock(SensorPorta.class);
        memoriaMock = mock(Memoria.class);
        cofrePM = new CofrePM(sensorMock, memoriaMock);
        when(sensorMock.fechada())
                .thenReturn(Boolean.TRUE);
        when(sensorMock.travada())
                .thenReturn(Boolean.TRUE);
        when(memoriaMock.getSenha())
                .thenReturn("123456");
    }

    @Given("^que eu entrei com (\\d+)$")
    public void que_eu_entrei_com(int arg1) throws Exception {
        this.cofrePM.pressButton(arg1);
    }

    @Given("^entrei com (\\d+)$")
    public void entrei_com(int arg1) throws Exception {
        this.cofrePM.pressButton(arg1);
    }

    @When("^eu pressionei ok$")
    public void eu_pressionei_ok() throws Exception {
        cofrePM.ok();
    }

    @Then("^o display deve mostrar a mensagem para senha invalida \"([^\"]*)\"$")
    public void o_display_deve_mostrar_a_mensagem_para_senha_invalida(String arg1) throws Exception {
        assertEquals("senha errada. Tente novamente", cofrePM.getDisplay());
    }

    @Then("^o display deve mostrar a mensagem para senha menor do que seis caracteres \"([^\"]*)\"$")
    public void o_display_deve_mostrar_a_mensagem_para_senha_menor_do_que_seis_caracteres(String arg1) throws Exception {
        assertEquals("senha errada. Tente novamente", cofrePM.getDisplay());
    }

    @Then("^o display deve mostrar a mensagem para senha valida \"([^\"]*)\"$")
    public void o_display_deve_mostrar_a_mensagem_para_senha_valida(String arg1) throws Exception {
        assertEquals("senha correta. Cofre aberto", cofrePM.getDisplay());
    }
}
